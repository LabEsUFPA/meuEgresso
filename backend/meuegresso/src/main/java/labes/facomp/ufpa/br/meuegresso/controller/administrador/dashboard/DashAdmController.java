package labes.facomp.ufpa.br.meuegresso.controller.administrador.dashboard;

import java.io.ByteArrayOutputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso.EgressoDashDTO;
import labes.facomp.ufpa.br.meuegresso.model.GrupoModel;
import labes.facomp.ufpa.br.meuegresso.model.UsuarioModel;
import labes.facomp.ufpa.br.meuegresso.service.grupo.GrupoService;
import labes.facomp.ufpa.br.meuegresso.service.usuario.UsuarioService;
import lombok.RequiredArgsConstructor;

/**
 * Responsável por fornecer um end-point para o dashboard do administrador.
 *
 * @author Bruno Eiki
 * @since 06/06/2023
 * @version 1.0
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/administrador/dashboard")
public class DashAdmController {

	private final GrupoService grupoService;
	private final UsuarioService usuarioService;

	private final ModelMapper mapper;

	/**
	 * Endpoint responsável por retornar uma lista de egressoDashDTO para
	 * disponibilizar dados no dashboard do administrador
	 *
	 * @param void
	 * @return List<EgressoDashDTO>
	 * @author Bruno Eiki
	 * @since 06/06/2023
	 */
	@GetMapping
	@PreAuthorize("hasRole('ADMIN')")
	@ResponseStatus(code = HttpStatus.OK)
	public Page<EgressoDashDTO> consultarEgressoDash(
			@RequestParam(name = "nome_usuario", defaultValue = "") String nomeUsuario,
			@RequestParam(name = "nome_empresa", defaultValue = "") String nomeEmpresa,
			@RequestParam(name = "date_min", defaultValue = "2023-05-19") LocalDate dateMin,
			@RequestParam(name = "date_max", defaultValue = "2023-06-19") LocalDate dateMax,
			@RequestParam(name = "ativo", defaultValue = "true") Boolean ativo,
			@RequestParam(defaultValue = "0", required = false) Integer page,
			@RequestParam(defaultValue = "20", required = false) Integer size,
			@RequestParam(defaultValue = "ASC", required = false) Direction direction) {

		GrupoModel grupoEgresso = grupoService.findByNomeGrupo("EGRESSO");

		mapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);

		Page<UsuarioModel> usuariosDash = usuarioService.findBySearch(nomeUsuario, nomeEmpresa, dateMin, dateMax, ativo,
				page, size, direction);

		List<EgressoDashDTO> dtoLista = usuariosDash.getContent().stream().map(u -> {
			EgressoDashDTO egressoDash = mapper.map(u, EgressoDashDTO.class);
			egressoDash.setNomeEmpresa(
					u.getEgresso() != null ? u.getEgresso().getEmprego().getEmpresa().getNome() : "Pendente");
			egressoDash.setCompleto(u.getGrupos().contains(grupoEgresso) && u.getEgresso() != null);
			return egressoDash;
		}).toList();

		return new PageImpl<>(dtoLista, usuariosDash.getPageable(),
				usuariosDash.getTotalElements());
	}

	/**
	 * Endpoint responsável por disponibilizar um pdf com dados de todos os egressos
	 *
	 * @return ResponseEntity<byte[]>
	 * @author Lucas Cantão
	 * @throws DocumentException
	 * @since 11/06/2023
	 */
	@GetMapping("/export")
	// @PreAuthorize("hasRole('ADMIN')")
	@ResponseStatus(code = HttpStatus.OK)
	public ResponseEntity<byte[]> exportarPDF() throws DocumentException {

		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

		Document document = new Document(PageSize.A4);
		Font bold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
		Font normal = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.NORMAL);
        
		PdfWriter.getInstance(document, outputStream);
        
		document.open();

		GrupoModel grupoEgresso = grupoService.findByNomeGrupo("EGRESSO");

		List<UsuarioModel> usuarios = usuarioService.findAll();

		List<EgressoDashDTO> egressos = usuarios.stream().map(u -> {
			EgressoDashDTO egressoDash = mapper.map(u, EgressoDashDTO.class);
			egressoDash.setNomeEmpresa(
					u.getEgresso() != null ? u.getEgresso().getEmprego().getEmpresa().getNome() : "Pendente");
			egressoDash.setCompleto(u.getGrupos().contains(grupoEgresso) && u.getEgresso() != null);
			return egressoDash;
		}).toList();

		document.add(new Paragraph("UNIVERSIDADE FEDERAL DO PARÁ"));
		document.add(new Paragraph("Listagem de Egressos", bold));
		document.add(new Paragraph("Data: " + LocalDateTime.now().toLocalDate() + "\nHorário: " + LocalDateTime.now().toLocalTime(), bold));
		document.add(new Paragraph("\n\n"));
		
        
		PdfPTable table = new PdfPTable(6); 
		float[] columnWidths = {1f, 2f, 2f, 2f, 2f, 2f};
		table.setWidths(columnWidths);


		table.addCell(new PdfPCell(new Paragraph("")));
		table.addCell(new PdfPCell(new Paragraph("Nome", bold)));
		table.addCell(new PdfPCell(new Paragraph("Empresa", bold)));
		table.addCell(new PdfPCell(new Paragraph("E-Mail", bold)));
		table.addCell(new PdfPCell(new Paragraph("Data Cadastro", bold)));
		table.addCell(new PdfPCell(new Paragraph("Situação", bold)));
		
		document.add(table);

		for (int i = 0; i < egressos.size(); i++){
			PdfPTable t = new PdfPTable(6);
			t.setWidths(columnWidths);
			t.addCell(new PdfPCell(new Paragraph((i+1)+"")));
			t.addCell(new PdfPCell(new Paragraph(egressos.get(i).getNome(), normal)));
			t.addCell(new PdfPCell(new Paragraph(egressos.get(i).getNomeEmpresa(), normal)));
			t.addCell(new PdfPCell(new Paragraph(egressos.get(i).getEmail(), normal)));
			t.addCell(new PdfPCell(new Paragraph(egressos.get(i).getCreatedDate().toLocalDate().toString(), normal)));
			t.addCell(new PdfPCell(new Paragraph(egressos.get(i).getAtivo().toString(), normal)));
			document.add(t);
		}

        document.close();

		byte[] pdfBytes = outputStream.toByteArray();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_PDF);
		headers.setContentDisposition(ContentDisposition.builder("attachment").filename("listagem-egresso-"+ LocalDateTime.now().toLocalDate().toString() +".pdf").build());

		return new ResponseEntity<>(pdfBytes, headers, HttpStatus.OK);
	}
}