package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AccountBankingEntity;
import com.mycompany.spring_mvc_project_final.repository.AccountBankingRepository;
import com.mycompany.spring_mvc_project_final.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public boolean isValidPaymentInfo(AccountBankingEntity accountBanking) {
        // Kiểm tra các trường Loại thanh toán, Tên Ngân Hàng, Số Tài Khoản
        // (Bạn có thể thực hiện các kiểm tra tùy thuộc vào yêu cầu của bạn)
        if ("CreditCard".equals(accountBanking.getPaymentType())
                && isValidCreditCardInfo(accountBanking)) {
            return true;
        } else if ("DebitCard".equals(accountBanking.getPaymentType())
                && isValidDebitCardInfo(accountBanking)) {
            return true;
        } else if ("BankTransfer".equals(accountBanking.getPaymentType())
                && isValidBankTransferInfo(accountBanking)) {
            return true;
        } else {
            return false;
        }
    }

    private boolean isValidCreditCardInfo(AccountBankingEntity accountBanking) {
        // Thực hiện kiểm tra thông tin thẻ tín dụng
        // (Bạn cần triển khai logic kiểm tra tùy thuộc vào yêu cầu của bạn)
        return true; // Giả sử thông tin hợp lệ
    }

    private boolean isValidDebitCardInfo(AccountBankingEntity accountBanking) {
        // Thực hiện kiểm tra thông tin thẻ ghi nợ
        // (Bạn cần triển khai logic kiểm tra tùy thuộc vào yêu cầu của bạn)
        return true; // Giả sử thông tin hợp lệ
    }

    private boolean isValidBankTransferInfo(AccountBankingEntity accountBanking) {
        // Thực hiện kiểm tra thông tin chuyển khoản ngân hàng
        // (Bạn cần triển khai logic kiểm tra tùy thuộc vào yêu cầu của bạn)
        return true; // Giả sử thông tin hợp lệ
    }
}
