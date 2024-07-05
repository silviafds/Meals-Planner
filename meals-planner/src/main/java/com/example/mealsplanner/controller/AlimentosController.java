package com.example.mealsplanner.controller;

import com.example.mealsplanner.domain.alimentos.Alimentos;
import com.example.mealsplanner.domain.alimentos.AlimentosDTO;
import com.example.mealsplanner.service.AlimentosService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

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
    public Alimentos listarAlimentoIndividual(@PathVariable Long id) {
        return alimentosService.buscarAlimentosPorId(id);
    }

    @PostMapping("/cadastrarAlimento")
    public boolean cadastrarAlimento(@RequestBody @Valid AlimentosDTO alimentosDTO) {
        return alimentosService.cadastroAlimento(alimentosDTO);
    }
}
