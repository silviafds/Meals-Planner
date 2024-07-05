package com.example.mealsplanner.repository;

import com.example.mealsplanner.domain.bebidas.Bebidas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BebidasRepository extends JpaRepository<Bebidas, Long> {

    @Query("SELECT b FROM Bebidas b")
    List<Bebidas> buscarTodasBebidas();

    @Query("SELECT b FROM Bebidas b where b.id = :id")
    Bebidas buscarBebidasPorId(Long id);

}
