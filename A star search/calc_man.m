function [ man_dist ] = calc_man( M,G,C )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

man_dist=3*M+sum(abs(G-C));


end

