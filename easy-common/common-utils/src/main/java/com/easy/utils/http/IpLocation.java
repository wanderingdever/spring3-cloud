package com.easy.utils.http;

import lombok.Data;

import java.io.Serializable;

/**
 * ip属性
 * </p>
 *
 * @author Matt
 */
@Data
public class IpLocation implements Serializable {

    private String ip;

    private String country;

    private String province;

    private String city;

    private String isp;


}