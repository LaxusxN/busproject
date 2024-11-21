package com.bus.springboot.app.crudbus.entity;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;

import java.util.Date;

@Data
@Entity
@Table(name="tbl_bus")

public class bus {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long busId;

    @Column(name="Número de bus")
    private int busNumber;

    @Column(name="Placa",unique=true)
    private String placa;

    @Column(name="Características")
    private String busDetail;

    @ManyToOne // Relación con la tabla Marca
    @JoinColumn(name = "marca_id")
    private marca busMarca;

    @Column(name="Activo o Inactivo")
    private boolean busStatus;

    @CreatedDate
    private Date creationDate;

}
