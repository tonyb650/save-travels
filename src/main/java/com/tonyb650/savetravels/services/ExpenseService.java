package com.tonyb650.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.tonyb650.savetravels.models.Expense;
import com.tonyb650.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	private final ExpenseRepository expenseRepository;
	
	public ExpenseService(ExpenseRepository expenseRepository) {
		this.expenseRepository = expenseRepository;
	}
	
	public List<Expense> allExpenses(){
		return expenseRepository.findAll();
	}
	
	public Expense getExpenseByID(Long id){
		Optional<Expense> optionalExp = expenseRepository.findById(id);
		if(optionalExp.isPresent()) {
			return optionalExp.get();
		}
		return null;
	}
	
	public void create(Expense expense) {
		expenseRepository.save(expense);
	}
	
	public void update(Expense expense) {
		expenseRepository.save(expense);
	}
	
	public void delete(Long id) {
		expenseRepository.deleteById(id);
	}
}
