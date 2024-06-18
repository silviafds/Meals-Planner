package com.example.mealsplanner.service;

import com.example.mealsplanner.domain.pratos.Pratos;
import com.example.mealsplanner.repository.PratosRepository;
import org.springframework.stereotype.Service;

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

    public List<Pratos> buscarPratosPorId(Long id) {
        return pratosRepository.buscarPratosPorId(id);
    }


}
