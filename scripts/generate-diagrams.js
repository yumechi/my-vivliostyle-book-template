const { readdirSync, mkdirSync } = require('fs')
const { execSync } = require('child_process')
const { basename } = require('path')

mkdirSync('manuscripts/images', { recursive: true })

const files = readdirSync('diagrams').filter(f => f.endsWith('.mmd'))

for (const file of files) {
  const name = basename(file, '.mmd')
  const input = `diagrams/${file}`
  const output = `manuscripts/images/${name}.svg`
  console.log(`Generating ${output} from ${input}`)
  execSync(`mmdc -i ${input} -o ${output} --backgroundColor white -p puppeteer-config.json`, { stdio: 'inherit' })
}
