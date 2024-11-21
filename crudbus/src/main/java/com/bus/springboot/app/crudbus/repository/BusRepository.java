package com.bus.springboot.app.crudbus.repository;


import com.bus.springboot.app.crudbus.entity.bus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BusRepository extends JpaRepository<bus, Long> {
}
