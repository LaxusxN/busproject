package com.bus.springboot.app.crudbus.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import com.bus.springboot.app.crudbus.entity.bus;
import com.bus.springboot.app.crudbus.services.BusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("/bus")
public class BusController {

    @Autowired
    private BusService busService;

    @GetMapping
    public ResponseEntity<List<bus>> getAllBuses() {
        List<bus> buses = busService.getAllBuses();
        return ResponseEntity.ok(buses);
    }

    @GetMapping("/{id}")
    public ResponseEntity<bus> getBusById(@PathVariable Long id) {
        bus bus = busService.getBusById(id);
        if (bus != null) {
            return ResponseEntity.ok(bus);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}

