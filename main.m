//
//  main.m
//  TheFlash
//
//  Created by Piotr Biegaj on 10/15/09.
//  Copyright Engine Yard Inc. 2009. All rights reserved.
//

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
