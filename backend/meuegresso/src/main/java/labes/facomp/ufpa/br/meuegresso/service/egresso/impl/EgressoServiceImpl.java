package labes.facomp.ufpa.br.meuegresso.service.egresso.impl;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.transaction.Transactional;
import labes.facomp.ufpa.br.meuegresso.model.EgressoModel;
import labes.facomp.ufpa.br.meuegresso.repository.egresso.EgressoRepository;
import labes.facomp.ufpa.br.meuegresso.service.egresso.EgressoService;
import lombok.RequiredArgsConstructor;

/**
 * Implementação do Serviço responsável pelas rotinas internas da aplicação
 * referente ao egresso.
 *
 * @author Joao Paulo
 * @since 16/04/2023
 * @version 1.0
 */
@Service
@RequiredArgsConstructor
public class EgressoServiceImpl implements EgressoService {

    private final EgressoRepository egressoRepository;

    @Value("${fotosDir}")
    private String uploadDirectory;

    @Override
    public EgressoModel adicionarEgresso(EgressoModel egressoModel) {
        return egressoRepository.save(egressoModel);
    }

    @Override
    @Transactional
    public EgressoModel findByUsuarioId(Integer idUsuario) {
        return egressoRepository.findByUsuarioId(idUsuario).orElseThrow();
    }

    /**
     *
     *
     * @param egresso Dados do egresso
     * @return Dados após serem gravados no banco de dados.
     * @author Pedro Inácio
     * @since 16/04/2023
     */
    @Override
    public EgressoModel updateEgresso(EgressoModel egresso) {
        if (egresso.getId() != null) {
            egressoRepository.save(egresso);
        }
        return null;
    }

    @Override
    public void deleteById(Integer id) {
        egressoRepository.deleteById(id);

    }

    @Override
    public boolean deletarEgresso(EgressoModel egresso) {
        if (egressoRepository.existsById(egresso.getId())) {
            egressoRepository.deleteById(egresso.getId());
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean existsById(Integer id) {
        return egressoRepository.existsById(id);
    }

    @Override
    public boolean existsByIdAndCreatedById(Integer id, Integer createdBy) {
        return egressoRepository.existsByIdAndCreatedById(id, createdBy);
    }

    @Override
    public Resource getFileAsResource(String fotoNomeString) throws MalformedURLException, FileNotFoundException {

        Path file = Paths.get(String.format("%s%s", uploadDirectory + "/", fotoNomeString));
        if (file != null) {
            return new UrlResource(file.toUri());
        } else {
            throw new FileNotFoundException(fotoNomeString);
        }

    }

    @Override
    public void deleteFile(String fotoNomeString) throws IOException {
        Path file = Paths.get(String.format("%s%s", uploadDirectory + "/", fotoNomeString));
        Files.deleteIfExists(file);
    }

    @Override
    public void saveFoto(String nomeFoto, MultipartFile arquivo) throws IOException {
        Path uploadPath = Paths.get(uploadDirectory + "/");

        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        try (InputStream inputStream = arquivo.getInputStream()) {
            Path filePath = uploadPath.resolve(nomeFoto);
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException ioe) {
            throw new IOException("Could not save file: " + arquivo.getOriginalFilename(), ioe);
        }
    }

}
