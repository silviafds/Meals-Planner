package com.example.mealsplanner.repository;

import com.example.mealsplanner.domain.alimentos.Alimentos;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface AlimentosRepository extends JpaRepository<Alimentos, Long> {

    @Query("SELECT a FROM Alimentos a")
    List<Alimentos> buscarTodosAlimentos();

    @Query("SELECT a FROM Alimentos a where a.id = :id")
    Alimentos buscarAlimentosPorId(Long id);

}
