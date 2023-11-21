package com.mycompany.spring_mvc_project_final.service;
import com.mycompany.spring_mvc_project_final.entities.CategoryEntity;
import com.mycompany.spring_mvc_project_final.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    public List<CategoryEntity> getAvailableCategories(double numOfAdults, double numOfChildren) {
        double totalPeople = numOfAdults + numOfChildren;
        return categoryRepository.findByNumOfPeopleGreaterThanEqual(totalPeople);
    }

    public List<CategoryEntity> getAllCategories() {
        return categoryRepository.findAll();
    }
}

