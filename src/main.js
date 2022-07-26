import chalk from 'chalk';
import execa from 'execa';
import fs from 'fs';
import Listr from 'listr';
import ncp from 'ncp';
import path from 'path';
import { projectInstall } from 'pkg-install';
import { promisify } from 'util';
import figlet from 'figlet';

const access = promisify(fs.access);
const writeFile = promisify(fs.writeFile);
const copy = promisify(ncp);

async function copyTemplateFiles(options) {
  return copy(options.templateDirectory, options.targetDirectory, {
    clobber: false,
  });
}

export async function createProject(options) {
  options = {
    ...options,
    targetDirectory: options.targetDirectory || process.cwd(),
  };

  const fullPathName = new URL(import.meta.url).pathname;
  const templateDir = path.resolve(
    fullPathName.substr(fullPathName.indexOf('/')),
    '../../templates',
    options.template.toLowerCase()
  );
  options.templateDirectory = templateDir;

  try {
    await access(templateDir, fs.constants.R_OK);
  } catch (err) {
    console.error('%s invalid template name', chalk.red.bold('ERROR'));
    process.exit(1);
  }

  const tasks = new Listr(
    [
      {
        title: 'create project',
        task: () => copyTemplateFiles(options),
      },
      {
        title: 'install dependencies',
        task: () =>
          projectInstall({
            cwd: options.targetDirectory,
          }),
      },
    ],
    {
      exitOnError: false,
    }
  );

  await tasks.run();
  figlet(`pusakatest`, (err, data) => {
    console.log((data) + '\n');
    console.log(
      chalk.white(
        ` is ready to use. just run `+chalk.green(`npm run test`)
      )
    );
  });
  return true;
}
