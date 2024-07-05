package com.example.mealsplanner.controller;

import com.example.mealsplanner.domain.bebidas.Bebidas;
import com.example.mealsplanner.domain.bebidas.BebidaDTO;
import com.example.mealsplanner.service.BebidasService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

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
    public Bebidas listarTodosBebidas(@PathVariable Long id) {
        return bebidasService.buscarBebidasPorId(id);
    }

    @PostMapping("/criarBebida")
    public boolean cadastrarBebida(@RequestBody @Valid  BebidaDTO bebidaDto) {
        return bebidasService.cadastrarBebida(bebidaDto);
    }

}
