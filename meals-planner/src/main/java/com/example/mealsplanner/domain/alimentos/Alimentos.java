package com.example.mealsplanner.domain.alimentos;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Table(name = "alimentos")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Alimentos {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private Long id;
    private String nome;
    private String categoria;
    private BigDecimal calorias;
    private BigDecimal peso;
    private BigDecimal carboidratos;
    private BigDecimal sodio;
    private BigDecimal proteinas;
    private BigDecimal gordurasTotais;
    private BigDecimal gorduraSaturada;

}