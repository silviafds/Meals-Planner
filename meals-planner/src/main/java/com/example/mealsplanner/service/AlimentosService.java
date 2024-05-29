package com.example.mealsplanner.service;

import com.example.mealsplanner.domain.alimentos.Alimentos;
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

    public List<Alimentos> buscarAlimentosPorId(Long id) {
        return alimentosRepository.buscarAlimentosPorId(id);
    }


}
