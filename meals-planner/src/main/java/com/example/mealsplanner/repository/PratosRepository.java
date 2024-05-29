package com.example.mealsplanner.repository;

import com.example.mealsplanner.domain.pratos.Pratos;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PratosRepository extends JpaRepository<Pratos, Long> {

    @Query("SELECT p FROM Pratos p")
    List<Pratos> buscarTodosPratos();

    @Query("SELECT p FROM Pratos p where p.id = :id")
    List<Pratos> buscarPratosPorId(Long id);

}
