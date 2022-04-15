package com.kyle.dojosandninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.kyle.dojosandninjas.models.Dojo;
import com.kyle.dojosandninjas.models.Ninja;
import com.kyle.dojosandninjas.services.DojoService;
import com.kyle.dojosandninjas.services.NinjaService;

@Controller
public class MainController {
	
	@Autowired
	private DojoService dojoService;
	
	@Autowired
	private NinjaService ninjaService;
	
//	======== DISPLAY ROUTES ================
	// home index and show all dojos
	@GetMapping("/")
	public String index(@ModelAttribute("dojo") Dojo dojo, Model model) {
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		return "index.jsp";
	}
	
	// create a ninja page
	@GetMapping("/ninjas/new")
	public String createNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		return "create-ninja.jsp";
	}
	
	// show dojo with all the ninjas
	@GetMapping("/show/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		System.out.println("showing dojo");
		Dojo dojos = dojoService.findDojo(id);
		model.addAttribute("dojos", dojos);
		return "show.jsp";
	}
	
	
//	======= ACTION ROUTES ===============
	// create a new dojo
	@PostMapping("/create/dojo")
	public String create(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			List<Dojo> dojos = dojoService.allDojos();
			model.addAttribute("dojos", dojos);
			System.out.println("Error");
			return "index.jsp";
		} else {
			dojoService.createDojo(dojo);
			System.out.println("creating dojo successful");
			return "redirect:/";
		}
	}
	
	// create a ninja
	@PostMapping("/create/ninja")
	public String create(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			System.out.println("Error");
			List<Dojo> dojos = dojoService.allDojos();
			model.addAttribute("dojos", dojos);
			return "create-ninja.jsp";
		} else {
			ninjaService.createNinja(ninja);
			System.out.println("creating ninja successful");
			return "redirect:/";
		}
	}
	
	
	
	
}
