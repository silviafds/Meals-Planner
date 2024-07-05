package com.example.mealsplanner.service;

import com.example.mealsplanner.domain.bebidas.BebidaDTO;
import com.example.mealsplanner.domain.bebidas.Bebidas;
import com.example.mealsplanner.domain.pratos.PratoDTO;
import com.example.mealsplanner.domain.pratos.Pratos;
import com.example.mealsplanner.repository.BebidasRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BebidasService {

    private final BebidasRepository bebidasRepository;

    public BebidasService(BebidasRepository bebidasRepository) {
        this.bebidasRepository = bebidasRepository;
    }

    public List<Bebidas> buscarTodosBebidas() {
        return bebidasRepository.buscarTodasBebidas();
    }

    public Bebidas buscarBebidasPorId(Long id) {
        return bebidasRepository.buscarBebidasPorId(id);
    }

    public Boolean cadastrarBebida(BebidaDTO bebidaDto) {
        if(bebidaDto != null) {
            Bebidas novaBebida = new Bebidas();
            novaBebida.setNome(bebidaDto.getNome());
            novaBebida.setCategoria(bebidaDto.getCategoria());
            novaBebida.setCalorias(bebidaDto.getCalorias());
            novaBebida.setPeso(bebidaDto.getPeso());
            novaBebida.setCarboidratos(bebidaDto.getCarboidratos());
            novaBebida.setSodio(bebidaDto.getSodio());
            novaBebida.setProteinas(bebidaDto.getProteinas());
            novaBebida.setGordurasTotais(bebidaDto.getGordurasTotais());
            novaBebida.setGorduraSaturada(bebidaDto.getGorduraSaturada());
            bebidasRepository.save(novaBebida);
            return true;
        }
        return false;
    }
}
