class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': zhanghj@synapse.org,
  'foaf:name': zhanghj}
doc: 'SMC-RNA challenge isoform quantification submission

  '
hints: []
id: main
inputs:
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: index, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: merge/output, type: File}
steps:
- id: converter
  in:
  - {id: input, source: kallisto/output}
  out: [output]
  run: converter.cwl
- id: kallisto
  in:
  - {id: fastq1, source: TUMOR_FASTQ_1}
  - {id: fastq2, source: TUMOR_FASTQ_2}
  out: [output]
  run: kallisto.cwl
- id: merge
  in:
  - {id: kallisto_out, source: converter/output}
  - {id: rsem_out, source: rsem/output}
  out: [output]
  run: merge.cwl
- id: rsem
  in:
  - {id: fastq1, source: TUMOR_FASTQ_1}
  - {id: fastq2, source: TUMOR_FASTQ_2}
  - {id: index, source: index}
  out: [output]
  run: rsem.cwl
