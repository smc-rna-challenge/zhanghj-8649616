baseCommand: [merge.py]
class: CommandLineTool
cwlVersion: v1.0
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/zhanghj-8649616-zulu:1.0.0'}
inputs:
- id: kallisto_out
  inputBinding: {position: 1}
  type: File
- id: rsem_out
  inputBinding: {position: 2}
  type: File
outputs:
- id: output
  outputBinding: {glob: merged_out}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
