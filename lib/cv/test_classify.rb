#!/usr/bin/ruby -w0
# -*- coding: utf-8 -*-
require 'cv/template-matching-classifier'

DIRPATH = '/Users/fujisaki/Documents/workspace/mjtsumotter/samplecode/test_img'

tmc = CV::TemplateMatchingClassifier.new

pai_list = tmc.classify(DIRPATH + '/all.jpg')
p pai_list.size