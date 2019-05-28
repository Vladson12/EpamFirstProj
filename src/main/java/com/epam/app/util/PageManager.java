package com.epam.app.util;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

public class PageManager<T> {
    private int currentPage = 1;
    private final int maxItemsOnPage;
    private final int pagesScrollBarSize = 9;

    private int itemsCount;
    private int pagesCount;

    @Getter
    @Setter
    private List<T> itemList;

    @Getter
    @Setter
    private boolean sortIdentificator;

    public PageManager(int maxItemsOnPage) {
        this.maxItemsOnPage = maxItemsOnPage;
    }

    public void setCurrentPage(int pageNum) {
        this.currentPage = pageNum;
    }

    private int getStartIndex() {
        return (currentPage - 1) * maxItemsOnPage;
    }

    private int getEndIndex() {
        int endIndex = getStartIndex() + maxItemsOnPage;
        return endIndex <= itemsCount ? endIndex : itemsCount;
    }

    public List<T> sublist(List<T> list) {
        updatePagesCount(list);
        return list.subList(getStartIndex(), getEndIndex());
    }

    private void updatePagesCount(List<T> list) {
        itemsCount = list.size();
        pagesCount = itemsCount / maxItemsOnPage;
        if (pagesCount == 0 || (itemsCount % maxItemsOnPage > 0)) pagesCount++;
    }

    public List<Page> getPages() {
        List<Page> pages = new ArrayList<>();
        if (currentPage - pagesScrollBarSize / 2 <= 0) {
            for (int i = 1; i <= pagesScrollBarSize && i <= pagesCount; i++) {
                pages.add(new Page(i));
            }
        } else if (currentPage + pagesScrollBarSize / 2 >= pagesCount) {
            for (int i = pagesCount - pagesScrollBarSize + 1; i <= pagesCount; i++) {
                if (i <= 0) i = 1;
                pages.add(new Page(i));
            }
        } else {
            for (int i = currentPage - pagesScrollBarSize / 2; pages.size() < pagesScrollBarSize; i++) {
                pages.add(new Page(i));
            }
        }
        return pages;
    }

    public void nextPage() {
        if (currentPage < pagesCount) {
            currentPage++;
        }
    }

    public void previousPage() {
        if (currentPage > 1) {
            currentPage--;
        }
    }

    static class Page {
        private final int number;

        Page(int number) {
            this.number = number;
        }

        public int getNumber() {
            return number;
        }
    }
}
