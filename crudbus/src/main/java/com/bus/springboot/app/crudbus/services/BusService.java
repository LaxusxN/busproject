package com.bus.springboot.app.crudbus.services;



import com.bus.springboot.app.crudbus.entity.bus;
import com.bus.springboot.app.crudbus.repository.BusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BusService {

    @Autowired
    private BusRepository busRepository;


    public List<bus> getAllBuses() {
        return busRepository.findAll();
    }


    public bus getBusById(Long id) {
        Optional<bus> bus = busRepository.findById(id);
        return bus.orElse(null);
    }
}

