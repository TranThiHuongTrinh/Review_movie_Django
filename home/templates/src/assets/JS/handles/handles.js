// Get 
export const getData = async (api) => {
  try {
    const response = await fetch(api);
    const data = await response.json();
    return data;
  } catch (error) {
    throw new Error(error);
  }
};

// Add
export const addItem = async (itemData, api) => {
    try {
        const response = await fetch(`${api}`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(itemData)
        });
        const newItem = await response.json();
        return newItem;
      } catch (error) {
        console.log(error);
      }
}

//Update
export const updateItem = async (itemData, api) => {
  try {
      const response = await fetch(`${api}`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(itemData)
      });

  } catch (error) {
      console.log(error);
  }
}


// delete 
export const delItem = async (api) => {
    try {
      const response = await fetch(`${api}`, {
        method: 'DELETE'
      });
      window.location.reload()
    } catch (error) {
      console.log(error);
    }
}

