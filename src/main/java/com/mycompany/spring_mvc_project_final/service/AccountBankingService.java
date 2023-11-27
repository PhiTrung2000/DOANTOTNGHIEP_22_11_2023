package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AccountBankingEntity;
import com.mycompany.spring_mvc_project_final.repository.AccountBankingRepository;
import com.mycompany.spring_mvc_project_final.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class AccountBankingService {

    @Autowired
    private AccountBankingRepository accountBankingRepository;

    @Autowired
    private AccountRepository accountRepository;

    public Long getAccountIdByUsername(String email) {
        // Giả sử có một phương thức trong AccountRepository để lấy accountId từ username
        return accountRepository.findAccountIdByEmail(email);
    }

    public AccountBankingEntity getAccountBankingByAccountId(Long accountId) {
        // Giả sử có một phương thức trong AccountBankingRepository để lấy thông tin thanh toán từ accountId
        return accountBankingRepository.findByAccountId(accountId);
    }

    @Transactional
    public boolean processPayment(AccountBankingEntity accountBanking, double amountPayment) {
        double amount = accountBanking.getBalance();
        double amountFinish = amount - amountPayment;

        if (amountFinish >= 0) {
            accountBanking.setBalance(amountFinish);
            accountBankingRepository.save(accountBanking);
            return true;
        } else {
            return false;
        }
    }

}
