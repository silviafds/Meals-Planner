package com.example.mealsplanner.controller;

import com.example.mealsplanner.domain.alimentos.Alimentos;
import com.example.mealsplanner.service.AlimentosService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/alimento")
public class AlimentosController {

    private final AlimentosService alimentosService;

    public AlimentosController(AlimentosService alimentosService) {
        this.alimentosService = alimentosService;
    }

    @GetMapping("/listaAlimentos")
    public List<Alimentos> listarTodosAlimentos() {
        return alimentosService.buscarTodosAlimentos();
    }

    @GetMapping("/listaAlimentosIndividual/{id}")
    public List<Alimentos> listarTodosAlimentos(@PathVariable Long id) {
        return alimentosService.buscarAlimentosPorId(id);
    }
}
