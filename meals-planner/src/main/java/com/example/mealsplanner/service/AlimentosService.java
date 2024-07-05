package com.example.mealsplanner.service;

import com.example.mealsplanner.controller.AlimentosController;
import com.example.mealsplanner.domain.alimentos.Alimentos;
import com.example.mealsplanner.domain.alimentos.AlimentosDTO;
import com.example.mealsplanner.domain.pratos.PratoDTO;
import com.example.mealsplanner.domain.pratos.Pratos;
import com.example.mealsplanner.repository.AlimentosRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AlimentosService {

    private final AlimentosRepository alimentosRepository;

    public AlimentosService(AlimentosRepository alimentosRepository) {
        this.alimentosRepository = alimentosRepository;
    }

    public List<Alimentos> buscarTodosAlimentos() {
        return alimentosRepository.buscarTodosAlimentos();
    }

    public Alimentos buscarAlimentosPorId(Long id) {
        return alimentosRepository.buscarAlimentosPorId(id);
    }

    public Boolean cadastroAlimento(AlimentosDTO alimentosDTO) {
        if(alimentosDTO != null) {
            Alimentos novoAlimentos = new Alimentos();
            novoAlimentos.setNome(alimentosDTO.getNome());
            novoAlimentos.setCategoria(alimentosDTO.getCategoria());
            novoAlimentos.setCalorias(alimentosDTO.getCalorias());
            novoAlimentos.setPeso(alimentosDTO.getPeso());
            novoAlimentos.setCarboidratos(alimentosDTO.getCarboidratos());
            novoAlimentos.setSodio(alimentosDTO.getSodio());
            novoAlimentos.setProteinas(alimentosDTO.getProteinas());
            novoAlimentos.setGordurasTotais(alimentosDTO.getGordurasTotais());
            novoAlimentos.setGorduraSaturada(alimentosDTO.getGorduraSaturada());
            alimentosRepository.save(novoAlimentos);
            return true;
        }
        return false;
    }
}
