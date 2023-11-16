package com.tonyb650.savetravels.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.tonyb650.savetravels.models.Expense;
import com.tonyb650.savetravels.services.ExpenseService;

import jakarta.validation.Valid;

@Controller
public class ExpenseController {
	
	@Autowired
	private ExpenseService expenseService;
	
//	private final ExpenseService expenseService;
//	
//	public ExpenseController(ExpenseService expenseService) {
//		this.expenseService=expenseService;
//	}

	@GetMapping("")
	public String index() {
		return "redirect:/dashboard";
	}
	
	@GetMapping("/dashboard")
	public String expenseDashboard(@ModelAttribute("expense") Expense expense,  Model model) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenseList", expenses);
		return "dashboard.jsp";
	}

	@GetMapping("/expense/{id}/edit")
	public String editExpense(@PathVariable("id") Long id, Model model) {
		Expense expense = expenseService.getExpenseByID(id);
		model.addAttribute(expense);
		return "edit.jsp";
	}
	
	@GetMapping("/expense/{id}/detail")
	public String detailExpense(@PathVariable("id") Long id, Model model) {
		Expense focusExp = expenseService.getExpenseByID(id);
		model.addAttribute("expense", focusExp);
		return "detail.jsp";
	}
	
	@PutMapping("/expense/{id}")
	public String updateExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		expenseService.update(expense);
		return "redirect:/";
	}
	
	@PostMapping("/expense")
	public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute(expenseService.allExpenses());
			return "dashboard.jsp";
		}
		expenseService.create(expense);
		return "redirect:/";
	}
	
	@DeleteMapping("/expense/{id}/delete")
	public String destroyExpense(@PathVariable("id") Long id) {
		expenseService.delete(id);
		return "redirect:/";
	}
	
}
