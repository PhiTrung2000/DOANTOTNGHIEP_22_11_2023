package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AccountBankingEntity;
import com.mycompany.spring_mvc_project_final.entities.DiscountEntity;
import com.mycompany.spring_mvc_project_final.repository.DiscountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiscountService {
    @Autowired
    private DiscountRepository discountRepository;
    public DiscountEntity getDiscountByCode(String code) {
        return discountRepository.findByCode(code);
    }
}
