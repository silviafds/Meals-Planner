package com.example.mealsplanner.controller;

import com.example.mealsplanner.domain.bebidas.Bebidas;
import com.example.mealsplanner.service.BebidasService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/bebidas")
public class BebidasController {

    private final BebidasService bebidasService;

    public BebidasController(BebidasService bebidasService) {
        this.bebidasService = bebidasService;
    }

    @GetMapping("/listaBebidas")
    public List<Bebidas> listarTodosBebidas() {
        return bebidasService.buscarTodosBebidas();
    }

    @GetMapping("/listaBebidasIndividual/{id}")
    public List<Bebidas> listarTodosAlimentos(@PathVariable Long id) {
        return bebidasService.buscarBebidasPorId(id);
    }
}
