package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.bean.Artist;

@Repository
public interface ArtistRepository extends CrudRepository<Artist, Integer> {

}
