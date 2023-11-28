package com.easy.system.bean;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * </p>
 *
 * @author Matt
 */
@Data
public class Area implements Serializable {

    private static final long serialVersionUID = 4620816333354524541L;

    private String name;
    private String code;
    private List<Area> children;
}