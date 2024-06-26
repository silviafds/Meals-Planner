package com.example.mealsplanner.controller;

import com.example.mealsplanner.domain.pratos.Pratos;
import com.example.mealsplanner.service.PratosService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/pratos")
public class PratosController {

    private final PratosService pratosService;

    public PratosController(PratosService pratosService) {
        this.pratosService = pratosService;
    }

    @GetMapping("/listaPratos")
    public List<Pratos> listarTodosPratos() {
        return pratosService.buscarTodosPratos();
    }

    @GetMapping("/listaPratosIndividual/{id}")
    public List<Pratos> listarTodosPratos(@PathVariable Long id) {
        return pratosService.buscarPratosPorId(id);
    }

    @GetMapping("/filtrarPratos/{calorias}")
    public List<Pratos> filtrarPratos(@PathVariable BigDecimal calorias) {
        return pratosService.filtrarPatrosPorCaloria(calorias);
    }
}
