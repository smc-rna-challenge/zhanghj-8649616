baseCommand: [kallisto, quant, -i, /usr/local/share/kallisto/kallisto.idx, -o, out]
class: CommandLineTool
cwlVersion: v1.0
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/zhanghj-8649616-kilo27:1.0.0'}
inputs:
- id: fastq1
  inputBinding: {position: 1}
  type: File
- id: fastq2
  inputBinding: {position: 2}
  type: File
outputs:
- id: output
  outputBinding: {glob: out/abundance.tsv}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
