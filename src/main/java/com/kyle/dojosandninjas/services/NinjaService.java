package com.kyle.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kyle.dojosandninjas.models.Ninja;
import com.kyle.dojosandninjas.repositories.NinjaRepo;



@Service
public class NinjaService {
	
private final NinjaRepo ninjaRepo;
	
	public NinjaService(NinjaRepo ninjaRepo) {
		this.ninjaRepo = ninjaRepo;
	}
	// or use 
		//@Autowired
//		private TravelRepo travelRepo;
	
	
	
	
	
	//returns all the ninjas
	public List<Ninja> allNinjas(){
		return ninjaRepo.findAll();
	}
	
	//create a ninja
	public Ninja createNinja(Ninja d) {
		return ninjaRepo.save(d);
	}
	
	// find one
		public Ninja findNinja(Long id) {
			Optional<Ninja> optionalNinja = ninjaRepo.findById(id);
			if (optionalNinja.isPresent()) {
				return optionalNinja.get();
			} else {
				return null;
			}
		}
}
