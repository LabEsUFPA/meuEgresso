package labes.facomp.ufpa.br.meuegresso.controller.administrador.dashboard;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import java.io.ByteArrayOutputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
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

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import labes.facomp.ufpa.br.meuegresso.controller.publico.egresso.EgressoPubController;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.egresso.EgressoDashDTO;
import labes.facomp.ufpa.br.meuegresso.dto.administradores.notificacao.NotificacaoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.EgressoCadastroAnualGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.EgressoCadastroDiaGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.dto.publico.grafico.EgressoCadastroMensalGraficoDTO;
import labes.facomp.ufpa.br.meuegresso.exceptions.NotFoundFotoEgressoException;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import labes.facomp.ufpa.br.meuegresso.service.empresa.EmpresaService;
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

	private static final Logger logger = LoggerFactory.getLogger(DashAdmController.class);

	private final UsuarioService usuarioService;
	private final EgressoService egressoService;
	private final EmpresaService empresaService;

	/**
	 * Endpoint responsável por retornar uma lista de egressoDashDTO para
	 * disponibilizar dados no dashboard do administrador
	 *
	 * @param void
	 * @return List<EgressoDashDTO>
	 * @author Bruno Eiki, Alfredo Gabriel
	 * @since 06/06/2023
	 */
	@GetMapping
	// @PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public Page<EgressoDashDTO> consultarEgressoDash(
			@RequestParam(name = "nome_usuario", defaultValue = "") String nomeUsuario,
			@RequestParam(name = "status", defaultValue = "incompleto") String[] status,
			@RequestParam(defaultValue = "0", required = false) Integer page,
			@RequestParam(defaultValue = "20", required = false) Integer size,
			@RequestParam(defaultValue = "ASC", required = false) Direction direction) {
		Page<EgressoDashDTO> egressos = usuarioService.findBySearch(nomeUsuario, status, page, size, direction);
		egressos.forEach(e -> {
			if (e.getIdEgresso() != null) {
				try {
					e.setFoto(linkTo(methodOn(
							EgressoPubController.class).getFotoEgresso(
									e.getIdEgresso()))
							.toUri()
							.toString());
				} catch (NotFoundFotoEgressoException e1) {
					logger.info("Usuario sem foto", e1);
				}
			}
		});
		return egressos;
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
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public ResponseEntity<byte[]> exportarPDF() throws DocumentException {

		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

		Document document = new Document(PageSize.A4);
		Font bold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
		Font normal = new Font(Font.FontFamily.TIMES_ROMAN, 10, Font.NORMAL);

		PdfWriter.getInstance(document, outputStream);

		document.open();

		List<EgressoDashDTO> egressos = usuarioService.findBySearch("",
				new String[] { "pendente", "inativo", "completo", "incompleto" }, 0, 20, Direction.ASC).toList();

		document.add(new Paragraph("UNIVERSIDADE FEDERAL DO PARÁ"));
		document.add(new Paragraph("Listagem de Egressos", bold));
		document.add(new Paragraph(
				"Data: " + LocalDateTime.now().toLocalDate() + "\nHorário: " + LocalDateTime.now().toLocalTime(),
				bold));
		document.add(new Paragraph("\n\n"));

		PdfPTable table = new PdfPTable(6);
		float[] columnWidths = { 1f, 2f, 2f, 2f, 2f, 2f };
		table.setWidths(columnWidths);

		table.addCell(new PdfPCell(new Paragraph("")));
		table.addCell(new PdfPCell(new Paragraph("Nome", bold)));
		table.addCell(new PdfPCell(new Paragraph("Empresa", bold)));
		table.addCell(new PdfPCell(new Paragraph("E-Mail", bold)));
		table.addCell(new PdfPCell(new Paragraph("Data Cadastro", bold)));
		table.addCell(new PdfPCell(new Paragraph("Situação", bold)));

		document.add(table);

		for (int i = 0; i < egressos.size(); i++) {
			PdfPTable t = new PdfPTable(6);
			t.setWidths(columnWidths);
			t.addCell(new PdfPCell(new Paragraph((i + 1) + "")));
			t.addCell(new PdfPCell(new Paragraph(egressos.get(i).getNome(), normal)));
			t.addCell(new PdfPCell(new Paragraph(egressos.get(i).getNomeEmpresa(), normal)));
			t.addCell(new PdfPCell(new Paragraph(egressos.get(i).getEmail(), normal)));
			t.addCell(new PdfPCell(new Paragraph(egressos.get(i).getCreatedDate().toString(), normal)));
			t.addCell(new PdfPCell(new Paragraph(egressos.get(i).getStatus(), normal)));
			document.add(t);
		}

		document.close();

		byte[] pdfBytes = outputStream.toByteArray();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_PDF);
		headers.setContentDisposition(ContentDisposition.builder("attachment")
				.filename("listagem-egresso-" + LocalDateTime.now().toLocalDate().toString() + ".pdf").build());

		return new ResponseEntity<>(pdfBytes, headers, HttpStatus.OK);
	}

	/**
	 * Endpoint responsável por notificar situação do cadastro do usuário
	 *
	 * @return Uma instância de NotificacaoDTO contendo as informações de
	 *         status dos usuários.
	 * @author Eude Monteiro
	 * @since 12/06/2023
	 */
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
	@GetMapping(value = "/notificacaoStatus")
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public Page<NotificacaoDTO> getStatus(
			@RequestParam(name = "nome", defaultValue = "", required = false) String nome,
			@RequestParam(name = "status", defaultValue = "", required = false) String status,
			@RequestParam(defaultValue = "0", required = false) Integer page,
			@RequestParam(defaultValue = "20", required = false) Integer size,
			@RequestParam(defaultValue = "ASC", required = false) Direction direction) {

		return usuarioService.getStatus(nome, status, page, size, direction);

	}

	@GetMapping(value = "/cadastro/dia")
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public EgressoCadastroDiaGraficoDTO getCadastroEgressoDiario() {
		Map<LocalDate, Long> egressoCadDia = egressoService.countEgressoPorData();

		return new EgressoCadastroDiaGraficoDTO(egressoCadDia);
	}

	@GetMapping(value = "/cadastro/mes")
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public EgressoCadastroMensalGraficoDTO getCadastroEgressoMensal() {
		Map<LocalDate, Long> egressoCadMes = egressoService.countEgressoPorMesEAno();

		return new EgressoCadastroMensalGraficoDTO(egressoCadMes);
	}

	@GetMapping(value = "/cadastro/ano")
	@PreAuthorize("hasRole('ADMIN') or hasRole('SECRETARIO')")
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public EgressoCadastroAnualGraficoDTO getCadastroEgressoAno() {
		Map<Integer, Long> egressoCadAno = egressoService.countEgressoPorAno();

		return new EgressoCadastroAnualGraficoDTO(egressoCadAno);
	}

	/**
	 * Endpoint responsável por deletar todos os dados da tabela egressos e
	 * associados
	 *
	 * @return ResponseEntity<String> confirmação de retorno
	 * @author Lucas Cantão
	 * @since 12/06/2023
	 */
	@DeleteMapping("/deleteall")
	@PreAuthorize("hasRole('ADMIN')")
	@ResponseStatus(code = HttpStatus.OK)
	@Operation(security = { @SecurityRequirement(name = "Bearer") })
	public ResponseEntity<String> deleteAll() {
		egressoService.deleteAll();
		empresaService.deleteAll();
		if (egressoService.findAll().isEmpty() && empresaService.findAll().isEmpty()) {
			return new ResponseEntity<>("Todos os dados deletados com sucesso", null, HttpStatus.OK);
		} else {
			return new ResponseEntity<>("Dados não deletados", null, HttpStatus.EXPECTATION_FAILED);
		}
	}

}