baseCommand: [converter.sh]
class: CommandLineTool
cwlVersion: v1.0
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/zhanghj-8649616-kilo27:1.0.0'}
inputs:
- id: input
  inputBinding: {position: 1}
  type: File
outputs:
- id: output
  outputBinding: {glob: out}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
stdout: out
