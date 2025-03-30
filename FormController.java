package com.HTML.FORM;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class FormController {
    
    @GetMapping("/form")
    public String showForm(Model model) {
        
        model.addAttribute("form", new Form());
        return "form"; 
    }

    @PostMapping("/submit")
    public String submitForm(@ModelAttribute("Form") Form form, Model model) {
        model.addAttribute("Form", form); 
        return "success";
    }
}
