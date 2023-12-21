package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<CategoryEntity, Integer> {
    List<CategoryEntity> findByNumOfPeopleGreaterThanEqual(double totalPeople);
    List<CategoryEntity> findAll();

    @Query("SELECT c.id FROM CategoryEntity c WHERE c.name = :categoryName")
    Long findCategoryIdByName(@Param("categoryName") String categoryName);

    CategoryEntity findByName(String name);

    List<CategoryEntity> findByNameContaining(String searchCate);
    long count();
}

