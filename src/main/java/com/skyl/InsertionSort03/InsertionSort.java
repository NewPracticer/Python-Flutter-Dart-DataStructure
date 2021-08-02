package com.skyl.InsertionSort03;

/**
 * 插入排序
 * 仅向已经排序好的前面数组按大小进行对应位置的插入
 */
public class InsertionSort {
    private InsertionSort(){}

    //传统插入排序
    public static <E extends Comparable<E>> void sort(E[] arr){

        for(int i = 0; i < arr.length; i ++){

            // 将 arr[i] 插入到合适的位置
            E t = arr[i];
            int j;
            for(j = i; j - 1 >= 0 && t.compareTo(arr[j - 1]) < 0; j --){
                arr[j] = arr[j - 1];
            }
            arr[j] = t;
        }
    }

    // 换个方法实现插入排序法，我们叫 sort2
    // 减少数据交换
    public static <E extends Comparable<E>> void sort2(E[] arr){

        for(int i = arr.length - 1; i >= 0; i --){

            // 将 arr[i] 插入到合适的位置
            E t = arr[i];
            int j;
            for(j = i; j + 1 < arr.length && t.compareTo(arr[j + 1]) > 0; j ++){
                arr[j] = arr[j + 1];
            }
            arr[j] = t;
        }
    }

    private static <E extends Comparable<E>> boolean isSorted(E[] arr){

        for(int i = 1; i < arr.length; i ++)
            if(arr[i - 1].compareTo(arr[i]) > 0)
                return false;
        return true;
    }
}
