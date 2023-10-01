package com.muling.db.runner.filter;

import java.io.File;
import java.io.FileFilter;

public class DirFilter implements FileFilter {

    @Override
    public boolean accept(File pathname) {
        boolean result = true;
        if (pathname.getName().equals(".") || pathname.getName().equals("..")){
            result = false;
        }
        return pathname.isDirectory() && result;
    }
}
