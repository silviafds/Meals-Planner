package com.example.mealsplanner.service;

import com.example.mealsplanner.domain.bebidas.Bebidas;
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

    public List<Bebidas> buscarBebidasPorId(Long id) {
        return bebidasRepository.buscarBebidasPorId(id);
    }


}
