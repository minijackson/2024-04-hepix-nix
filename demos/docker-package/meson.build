project('production-grade-hello-hepix', 'cpp',
  version : '1.0.0',
  default_options : ['warning_level=3'])

boost = dependency('boost', modules: ['log'])

exe = executable(
  'production-grade-hello-hepix',
  ['production-grade-hello-hepix.cpp'],
  dependencies: [boost],
  install : true)

test('basic', exe)
