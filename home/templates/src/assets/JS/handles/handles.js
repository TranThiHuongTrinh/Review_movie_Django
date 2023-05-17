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
      } catch (error) {
        console.log(error);
      }
}

//Update
export const updateItem = async (id, itemData, api) => {
  console.log(itemData);
  try {
      const response = await fetch(`${api}/${id}`, {
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
export const delItem = async (id, api) => {
    try {
      const response = await fetch(`${api}/${id}`, {
        method: 'DELETE'
      });
    } catch (error) {
      console.log(error);
    }
}

