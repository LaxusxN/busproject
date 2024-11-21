package com.bus.springboot.app.crudbus.entity;

import com.fasterxml.jackson.annotation.JsonTypeId;
import jakarta.persistence.*;
import lombok.Data;

import javax.annotation.processing.Generated;
@Data
@Entity
@Table(name="tbl_marca")

public class marca {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;

    @Column(name="Nombre")
    private String name;
}
