package com.skyl.LinearSearch01;

/**
 * 使用泛型的线性查找
 */
public class LinearSearch {

    private LinearSearch(){}

    public static <E> int search(E[] data, E target){

        for(int i = 0; i < data.length; i ++)
            if(data[i].equals(target))
                return i;

        return -1;
    }

    public static void main(String[] args){

        Integer[] data = {24, 18, 12, 9, 16, 66, 32, 4};

        int res = LinearSearch.search(data, 16);
        System.out.println(res);

        int res2 = LinearSearch.search(data, 666);
        System.out.println(res2);
    }
}
