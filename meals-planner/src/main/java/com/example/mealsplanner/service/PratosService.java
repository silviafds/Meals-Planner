package com.example.mealsplanner.service;

import com.example.mealsplanner.domain.pratos.PratoDTO;
import com.example.mealsplanner.domain.pratos.Pratos;
import com.example.mealsplanner.repository.PratosRepository;
import jakarta.validation.Valid;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.math.BigDecimal;
import java.util.List;

@Service
public class PratosService {

    private final PratosRepository pratosRepository;

    public PratosService(PratosRepository pratosRepository) {
        this.pratosRepository = pratosRepository;
    }

    public List<Pratos> buscarTodosPratos() {
        return pratosRepository.buscarTodosPratos();
    }

    public Pratos buscarPratosPorId(Long id) {
        return pratosRepository.buscarPratosPorId(id);
    }

    public List<Pratos> filtrarPatrosPorCaloria(BigDecimal caloria) {
        return pratosRepository.listarPratosCaloria(caloria);
    }

    public Boolean cadastroPrato(PratoDTO prato) {
        if(prato != null) {
            Pratos novoPrato = new Pratos();
            novoPrato.setNome(prato.getNome());
            novoPrato.setCategoria(prato.getCategoria());
            novoPrato.setCalorias(prato.getCalorias());
            novoPrato.setPeso(prato.getPeso());
            novoPrato.setCarboidratos(prato.getCarboidratos());
            novoPrato.setSodio(prato.getSodio());
            novoPrato.setProteinas(prato.getProteinas());
            novoPrato.setGordurasTotais(prato.getGordurasTotais());
            novoPrato.setGorduraSaturada(prato.getGorduraSaturada());
            pratosRepository.save(novoPrato);
            return true;
        }
        return false;
    }

}
