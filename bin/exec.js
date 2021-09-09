const execSync = require('child_process').execSync;

/**
 * @param {String} command
 * @param {Object} options
 *
 * @returns {string|null}
 */
module.exports = function(command, options = undefined) {
    try {
        return execSync(command, options).toString().trim();
    } catch (error) {
        if (error.stdout.length > 0) {
            console.error(error.stdout.toString().trim());
        }

        if (error.stderr.length > 0) {
            console.error(error.stderr.toString().trim());
        }

        return null;
    }
};
