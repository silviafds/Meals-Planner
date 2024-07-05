package com.example.mealsplanner.controller;

import com.example.mealsplanner.domain.pratos.PratoDTO;
import com.example.mealsplanner.domain.pratos.Pratos;
import com.example.mealsplanner.service.PratosService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

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
    public Pratos listarTodosPratos(@PathVariable Long id) {
        return pratosService.buscarPratosPorId(id);
    }

    @GetMapping("/filtrarPratos/{calorias}")
    public List<Pratos> filtrarPratos(@PathVariable BigDecimal calorias) {
        return pratosService.filtrarPatrosPorCaloria(calorias);
    }
    @PostMapping("/cadastrarPrato")
    public boolean cadastrarPrato(@RequestBody @Valid PratoDTO pratoDto) {
       return pratosService.cadastroPrato(pratoDto);
    }

}
