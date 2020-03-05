import algoliasearch from "algoliasearch";

const initAlgoliaSearch = () => {
  const inputField = document.querySelector("#query");
  const dropdown = document.getElementById('dropdown');

  if (inputField) {
    const appId = document.querySelector("meta[name='algolia-app-id']").content;
    const searchOnlyApiKey = document.querySelector("meta[name='algolia-search-only-api-key']").content;


    const client = algoliasearch(appId, searchOnlyApiKey);
    const index = client.initIndex('Motorbike');

    inputField.addEventListener("input", () => {
      index.search(inputField.value, { hitsPerPage: 10, page: 0 }).then((content) => {
        console.log(content);
        dropdown.innerHTML = '';
        content.hits.forEach(item => {
          const template = `
            <li><a href="/motorbikes/${item.objectID}">${item.make} ${item.model}</a></li>
          `;

          dropdown.insertAdjacentHTML('beforeend', template);
        })
        // handle results however you like...
      }).catch(console.error);
    });
  }
}

export { initAlgoliaSearch };
