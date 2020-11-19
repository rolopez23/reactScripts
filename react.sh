# Equivalent of dirname for 
__dirname="$(CDPATH= cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
name="$1"
file="$name.jsx"
touch $file
class="false"
echo $2
if [ "${2}" == "--class" ] 
then
  class="true"
fi 
echo $class
if [ "${class}" == "true" ];
then
  contents="import React from 'react';

  class ${name} extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
        class: true
      }
    }

    render() {
      return (
        <div>${name}</div>
      )
    }
  }

  export default ${name};
  "
else
  contents="import React from 'react';

  const ${name} = (props) => {

    return (
      <div>${name}</div>
    )
  } 

  export default ${name};"
fi 

echo "${contents}" > "$file"
echo "Created ${file}"
