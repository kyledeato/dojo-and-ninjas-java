package com.kyle.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kyle.dojosandninjas.models.Dojo;
import com.kyle.dojosandninjas.repositories.DojoRepo;

@Service
public class DojoService {
	// adds dojo repo as dependency
	private final DojoRepo dojoRepo;
	
	public DojoService(DojoRepo dojoRepo) {
		this.dojoRepo = dojoRepo;
	}
	// or use 
	//@Autowired
//	private TravelRepo travelRepo;
	
	
	
	
	//returns all the dojos
	public List<Dojo> allDojos(){
		return dojoRepo.findAll();
	}
	
	//create a dojo
	public Dojo createDojo(Dojo d) {
		return dojoRepo.save(d);
	}
	
	// find one
	public Dojo findDojo(Long id) {
		Optional<Dojo> optionalDojo = dojoRepo.findById(id);
		if (optionalDojo.isPresent()) {
			return optionalDojo.get();
		} else {
			return null;
		}
	}
}
